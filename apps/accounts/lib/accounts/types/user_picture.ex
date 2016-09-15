defmodule Accounts.UserPicture do
  use Arc.Definition
  use Arc.Ecto.Definition

  @versions [:original, :thumb]

  def validate({file, _}) do
    ~w(.jpg .jpeg .gif .png) |> Enum.member?(Path.extname(file.file_name))
  end

  def transform(:thumb, _) do
    {:convert, "-strip -thumbnail 300x300^ -gravity center -extent 300x300 -format png", :png}
  end

  def filename(version, _) do
    "avatar-#{version}"
  end

  def storage_dir(version, {file, scope}) do
    "media/user/#{scope.id}"
  end

  # Specify custom headers for s3 objects
  # Available options are [:cache_control, :content_disposition,
  #    :content_encoding, :content_length, :content_type,
  #    :expect, :expires, :storage_class, :website_redirect_location]
  #
  # def s3_object_headers(version, {file, scope}) do
  #   [content_type: Plug.MIME.path(file.file_name)]
  # end
end
