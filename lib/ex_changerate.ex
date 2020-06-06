defmodule ExChangerate do
  @moduledoc false

  def base_url do
    Application.fetch_env!(:ex_changerate, :api_instance)
  end
end
