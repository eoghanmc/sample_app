require 'spec_helper'

describe "Static pages" do

	describe "Home Page" do
		it "should have the content 'Sample App'" do

			visit '/static_pages/home'
			page.should have_selector('h1', :text => 'Sample App')
		end

		it "should have the base title" do
			visit '/static_pages/home'
			page.should have_selector('title',
														:text => 'Ruby on Rails Tutorial Sample App')
		end

		it "should not have a custom page title" do
			visit 'static_pages/home'
			page.should_not have_selector('title', :text = > '| Home')
		end
	end

	describe "About Page" do
		it "should have the content 'About Us'" do

			visit '/static_pages/about'
			page.should have_selector('h1', :text => 'About us')
		end

		it "should have the right title" do
			visit '/static_pages/about'
			page.should have_selector('title',
														:text => 'Ruby on Rails Tutorial Sample App | About')
		end
	end

	describe "Contact Page" do
		it "should have the content 'Contact'" do

			visit '/static_pages/contact'
			page.should have_selector('h1', :text => 'Contact')
		end

		it "should have the right title" do
			visit '/static_pages/contact'
			page.should have_selector('title',
														:text => 'Ruby on Rails Tutorial Sample App | Contact')
		end
	end

end
