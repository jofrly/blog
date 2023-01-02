# dev setup

    # mac
    # brew install vips

    # linux
    # apt install libvips

    cp .env.example .env
    bundle install
    yarn
    bin/dev # make sure docker is running and the pg port is available
    rails db:create
    rails db:migrate
