# setup

    # mac
    # brew install vips

    # linux
    # apt install libvips

    cp .env.example .env
    bundle install
    yarn
    bin/dev
    rails db:create
    rails db:migrate
