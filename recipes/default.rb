#
# Cookbook Name:: myhaproxy
# Recipe:: default
#
# Copyright (c) 2015 Tim Beeler, All Rights Reserved.

node.default['haproxy']['members'] =[{
  "hostname" => "ec2-54-84-204-79.compute-1.amazonaws.com",
  "ipaddress" => "ec2-54-84-204-79.compute-1.amazonaws.com",
  "port" => 80,
  "ssl_port" => 80
  },{
  "hostname" => "ec2-52-7-171-167.compute-1.amazonaws.com",
  "ipaddress" => "ec2-52-7-171-167.compute-1.amazonaws.com",
  "port" => 80,
  "ssl_port" => 80
    }]

  include_recipe "haproxy::default"