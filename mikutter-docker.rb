require File.expand_path(File.join(__dir__, 'mocker'))

Plugin.create(:docker) do
  def user_list
    @users ||= Gtk::UserList.new
  end

  user_list
  tab(:images, 'image') do
    expand
  end

  onboot do |service|
    begin
      @images ||= Mocker.images
    rescue => e
      STDERR.puts e
    end
  end

  onperiod do
    @images = Mocker.images
  end
end
