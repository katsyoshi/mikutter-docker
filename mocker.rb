require 'docker'
module Mocker
  module_function
  def images
    Docker::Image.all.map(&:info).map{|img| img['id']}
  end

  def run_images
    Docker::Container.all.map(&:id)
  end

  def start(image_hash_value, opts: {})
    container = Docker::Container.new(image_hash_value)
    container.start(opts)
  end

  def stop(image_hash_value)
    container = Docker::Container.get(image_hash_value)
    container.stop
  end

  class ImageList < Gtk::UserList
  end
  class RunList < Gtk::UserList
  end
end
