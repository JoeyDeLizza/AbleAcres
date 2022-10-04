FROM fedora:36
WORKDIR /home/app

# install dependencies
RUN dnf update -y
RUN dnf group install "C Development Tools and Libraries" -y
RUN dnf install ruby-devel zlib-devel sqlite dos2unix -y
RUN gem install rails
COPY . .
RUN find . -type f -exec dos2unix {} \;
EXPOSE 3000
RUN bin/bundle install
RUN umask 000
RUN bin/rake assets:precompile
RUN bin/rails db:migrate
# launch the web app

#starts server automatically, leave commented while developing
#CMD ["rails", "server", "-b", "0.0.0.0"]