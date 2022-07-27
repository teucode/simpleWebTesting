require 'selenium-webdriver'
require 'rubygems'
require 'rspec/expectations'

# Create new profile for Firefox
profile = Selenium::WebDriver::Firefox::Profile.new
profile.secure_ssl = true
driver = Selenium::WebDriver::Firefox::Options#profile=profile

# Make firefox trust our web
capabilities = Selenium::WebDriver::Remote::Capabilities.firefox(accept_insecure_certs: true)
driver = ''
driver = Selenium::WebDriver.for :firefox, desired_capabilities: capabilities

Given("Tampil Pelanggan") do
  driver.navigate.to "https://siaaweb.000webhostapp.com/tampilpelanggan.php"
end
Then("Tambah Pelanggan") do
    driver.find_element(name: 'tambah').click
    driver.find_element(name: 'id_pel').send_keys('100')
    driver.find_element(name: 'nama_pel').send_keys('saya')
    driver.find_element(name: 'telp_pel').send_keys('0876444567543')
    driver.find_element(name: 'alamat_pel').send_keys('Jl. Sejahtera No. 90')
  
    driver.find_element(name: 'simpan').click
    sleep (5)
    popup = driver.switch_to.alert
    popup.accept
    sleep (5)
  end
  Then("Cari Pelanggan") do
    driver.navigate.to "file php on website"
    driver.find_element(name: 'cari').send_keys('100')
  
    driver.find_element(name: 'btncari').click
    sleep (5)
  end
  Then("Update Pelanggan") do
    driver.find_element(name: 'edit').click
    driver.find_element(name: 'nama_pel').send_keys('tirza')
  
    driver.find_element(name: 'simpanedit').click
    sleep (5)
    popup = driver.switch_to.alert
    popup.accept
    sleep (5)
  end
  Then("Hapus Pelanggan") do
    driver.navigate.to "file php on website"
    driver.find_element(name: 'cari').send_keys('100')
  
    driver.find_element(name: 'btncari').click
    sleep (5)
    driver.find_element(name: 'hapus').click
  end

