
require 'bundler/setup'
Bundler.require(:default)
require 'pry'
require 'open-uri'
require 'dotenv/load'
require_relative './movieseries_cli/cli.rb'
require_relative './movieseries_cli/api.rb'
require_relative './movieseries_cli/movieseries.rb'
