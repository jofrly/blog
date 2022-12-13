# setup

    # mac
    # brew install vips

    # linux
    # apt install libvips

    cp .env.example .env
    bundle install
    yarn
    docker-compose up
    rails db:create
    rails db:migrate
