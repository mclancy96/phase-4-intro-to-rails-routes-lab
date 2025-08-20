require 'rails_helper'

RSpec.describe "Pages routes", type: :request do
  describe "GET /about" do
    it "routes /about to pages#about" do
      expect(get: "/about").to route_to(controller: "pages", action: "about")
    end

    it "returns 200, renders the about template, and includes 'About Page'" do
      get "/about"
      expect(response).to have_http_status(:ok)
      expect(response).to render_template(:about)
      expect(response.body).to include("About Page")
    end

    it "renders HTML with a <h1> or <h2> containing 'About'" do
      get "/about"
      expect(response.body).to match(/<h[12][^>]*>.*about.*<\/h[12]>/i)
    end

    it "does not include unrelated text on the about page" do
      get "/about"
      expect(response.body).not_to include("Contact Page")
    end
  end

  describe "GET /contact" do
    it "routes /contact to pages#contact" do
      expect(get: "/contact").to route_to(controller: "pages", action: "contact")
    end

    it "returns 200, renders the contact template, and includes 'Contact Page'" do
      get "/contact"
      expect(response).to have_http_status(:ok)
      expect(response).to render_template(:contact)
      expect(response.body).to include("Contact Page")
    end

    it "renders HTML with a <h1> or <h2> containing 'Contact'" do
      get "/contact"
      expect(response.body).to match(/<h[12][^>]*>.*contact.*<\/h[12]>/i)
    end

    it "does not include unrelated text on the contact page" do
      get "/contact"
      expect(response.body).not_to include("About Page")
    end
  end

  describe "Navigation and edge cases" do
    it "returns 404 for an unknown page" do
      get "/not_a_real_page"
      expect(response).to have_http_status(:not_found)
    end

    it "about and contact pages are accessible from the root if linked" do
      get "/"
      # This will pass if students add navigation links to root page
      expect(response.body).to match(/href=".*about.*/i).or match(/href='.*about.*/i)
      expect(response.body).to match(/href=".*contact.*/i).or match(/href='.*contact.*/i)
    end
  end
end
