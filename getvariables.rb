#!/usr/bin/ruby
require 'net/https'
require 'json'


uri = URI.parse("http://cloud-images.ubuntu.com/locator/ec2/releasesTable")
http = Net::HTTP.new(uri.host, uri.port)
request = Net::HTTP::Get.new(uri.request_uri)

shit = http.request(request).body
shit.gsub!("],\n]\n}", ']]}')
#                                                      region      distribution architecture hvm/pv                                  storagetype
data = Hash[JSON.parse(shit)['aaData'].map { |tuple| ["#{tuple[0]}-#{tuple[1]}-#{tuple[3]}-#{tuple[4].match(/^hvm:/)?'hvm':'pv'}-#{tuple[4].gsub(/^hvm:/, '')}", tuple[6].gsub(/.*>(ami-[^<]*)<.*/, '\1')] }]
output = {
  "variable" => {
    "all_amis" => {
      "description" => "The AMI to use",
      "default" => data 
    }
  }
}

puts JSON.pretty_generate(output)

