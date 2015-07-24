#
# Cookbook Name:: myhaproxy
# Recipe:: default
#
# Copyright (c) 2015 Tim Beeler, All Rights Reserved.

# old school 
#node.default['haproxy']['members'] =[{
#  
#"hostname" => "ec2-54-84-204-79.compute-1.amazonaws.com",
  #"ipaddress" => "ec2-54-84-204-79.compute-1.amazonaws.com",
  #"port" => 80,
  #"ssl_port" => 80
  #},{
  #"hostname" => "ec2-52-7-171-167.compute-1.amazonaws.com",
  #"ipaddress" => "ec2-52-7-171-167.compute-1.amazonaws.com",
  #"port" => 80,
  #"ssl_port" => 80
  #  }]

# dynamic version
#knife search for nodes "role:web"
all_web_nodes = search("node","role:web AND chef_environment:#{node.chef_environment}") # node_oject 

members =[]

#convert each web node object to hash with the hostname, ipaddress, port, and ssl_port
all_web_nodes.each do |web_node|
  member={
    "hostname" => web_node["cloud"]["public_hostname"],
    "ipaddress" => web_node["cloud"]["public_ipv4"],
    "port" => 80,
    "ssl_port" => 80
  }
  members.push(member)
end

node.default['haproxy']['members'] = members
 
include_recipe "haproxy::default"
