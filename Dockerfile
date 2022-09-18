FROM fedora:36
WORKDIR /app

# install dependencies
RUN dnf update -y
RUN dnf group install "C Development Tools and Libraries" -y
RUN dnf install ruby-devel zlib-devel sqlite -y
RUN gem install rails
COPY . .
RUN ls

EXPOSE 3000
RUN /bin/bundle install
# launch the web app
CMD ["rails", "server", "-b", "0.0.0.0"]