require 'rails_helper'

describe "Pages routes", type: :request do
  it "returns 200 and includes 'About Page' on /about" do
    get "/about"
    expect(response).to have_http_status(:ok)
    expect(response.body).to include("About Page")
  end

  it "returns 200 and includes 'Contact Page' on /contact" do
    get "/contact"
    expect(response).to have_http_status(:ok)
    expect(response.body).to include("Contact Page")
  end
end
