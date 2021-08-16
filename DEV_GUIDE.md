# Developer Guide

## MAC OS X users - setup

* Ruby - 2.7.3
* Headless chrome
* Node v12

## Windows users - setup

Recommended running under WSL 2 with: 

* Ruby - 2.7.3
* Headless chrome
* Node v12

### Install node

    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.38.0/install.sh | bash

>> As of writing the NVM version was `0.38` make sure you check the latest version [here](https://github.com/nvm-sh/nvm/releases)
### Install ruby

    sudo apt-get update
    sudo apt-get install git-core curl zlib1g-dev build-essential libssl-dev libreadline-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt1-dev libcurl4-openssl-dev software-properties-common libffi-dev

    cd
    git clone https://github.com/rbenv/rbenv.git ~/.rbenv
    echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc
    echo 'eval "$(rbenv init -)"' >> ~/.bashrc
    exec $SHELL
    
    git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build
    echo 'export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"' >> ~/.bashrc
    exec $SHELL
    
    rbenv install 3.0.1
    rbenv global 3.0.1
    ruby -v    

### Install headless chrome (WSL2)


    sudo apt-get install -y curl unzip xvfb libxi6 libgconf-2-4
    
    wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb

    sudo apt install ./google-chrome-stable_current_amd64.deb

## Running the app

Ensure you have created a .env file with the following keys: 

    GOOGLE_ANALYTICS_TAG=****
    CONTENTFUL_SPACE_ID=****
    CONTENTFUL_DELIVERY_TOKEN=****
    CONTENTFUL_ENVIRONMENT=***

Install gems and ruby deps 

    bundle install

Install npm deps

    npm install

Build frontend javascript
    
    npm run build

Get latest content from contentful

    bundle exec middleman contentful

Run middle man server

    bundle exec middleman server

## Testing the app

### Feature tests 
    
    MM_DATA_DIR=spec/data bundle exec rspec --pattern spec/features/*_spec.rb  --format RSpec::Github::Formatter  --format progress --format documentation --out feature-results.txt

### Accessibility tests

    bundle exec rspec --pattern spec/accessibility/*_spec.rb  --format RSpec::Github::Formatter  --format progress --format documentation --out accessibility.txt