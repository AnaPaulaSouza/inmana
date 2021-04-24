defmodule Inmana.RestaurantTest do
  use Inmana.DataCase, async: true #para testes que utiliza banco de dados

  alias Ecto.Changeset
  alias Inmana.Restaurant

  describe "changeset/1" do
    test "when all params are valid, returns valid changeset" do
      params = %{name: "Banana", email: "banana@gmail.com"}

      response = Restaurant.changeset(params)

      assert %Changeset{changes: %{email: "banana@gmail.com", name: "Banana"}, valid?: true} = response
    end

    test "when there are invalid params, returns an invalid changeset" do
      params = %{name: "B", email: ""}
      expected_response = %{
        email: ["can't be blank"],
        name: ["should be at least 2 character(s)"]
      }

      response = Restaurant.changeset(params)

      assert %Changeset{valid?: false} = response

      assert errors_on(response) == expected_response
    end
  end
end