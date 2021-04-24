defmodule Inmana.WelcomerTest do
  use ExUnit.Case, async: true

  alias Inmana.Welcomer

  describe "welcome/1" do
    test "when the user is special, returns a special message" do
      # SETUP
      params = %{"name" => "banana", "age" => "42"}
      expected_result = {:ok, "You are very special banana"}

      result = Welcomer.welcome(params)

      assert result == expected_result
    end

    test "when the user is not special, returns a message" do
      # SETUP
      params = %{"name" => "banana", "age" => "25"}
      expected_result = {:ok, "Welcome banana"}

      result = Welcomer.welcome(params)

      assert result == expected_result
    end

    test "when the user is under age, returns an error" do
      # SETUP
      params = %{"name" => "banana", "age" => "17"}
      expected_result = {:error, "You shall not pass banana"}

      result = Welcomer.welcome(params)

      assert result == expected_result
    end
  end
end
