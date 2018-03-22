class HomeController < ApplicationController
    def landing
      # IMPORTANT!
      # In order to allow restforce to connect you must grant privileges to the connected APP!
      # IMPORTANT!
      if current_user
        client = Restforce.new :oauth_token => current_user.oauth_token,
          :refresh_token => current_user.refresh_token,
          :instance_url  => current_user.instance_url,
          :client_id     => Rails.application.config.salesforce_app_id,
          :client_secret => Rails.application.config.salesforce_app_secret
          
        faccounts = client.query("select Id, Name from Account")
        @accounts = faccounts
        # puts "account object"
        # puts faccounts.inspect
        # puts "end of accounts"
        
        fopportunities = client.query("select Id, Name from Opportunity")
        @opportunities = fopportunities
        # puts "Opportunities object"
        # puts fopportunities.inspect
        # puts "end of Opportunities"

        fcontacts = client.query("select Id, Name from Contact")
        @contacts = fcontacts
        # puts "Contacts object"
        # puts fcontacts.inspect
        # puts "end of Contacts"

        puts "refresh token"
        puts current_user.refresh_token
      end
    end
  end