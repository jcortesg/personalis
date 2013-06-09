require "spec_helper"

describe KeysController do
  describe "routing" do

    it "routes to #index" do
      get("/keys").should route_to("keys#index")
    end

    it "routes to #new" do
      get("/keys/new").should route_to("keys#new")
    end

    it "routes to #show" do
      get("/keys/1").should route_to("keys#show", :id => "1")
    end

    it "routes to #edit" do
      get("/keys/1/edit").should route_to("keys#edit", :id => "1")
    end

    it "routes to #create" do
      post("/keys").should route_to("keys#create")
    end

    it "routes to #update" do
      put("/keys/1").should route_to("keys#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/keys/1").should route_to("keys#destroy", :id => "1")
    end

  end
end
