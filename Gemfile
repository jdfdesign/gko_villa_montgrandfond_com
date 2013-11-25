source :rubygems

group :assets do
 gem 'sass-rails', '~> 3.2.6'
 gem 'coffee-rails', '~> 3.2.2'
 gem 'uglifier', '>= 1.0.3'
end

group :production do
  git "git@github.com:jdfdesign/gko_cms3.git", :tag => "v0.8.09.rc1" do
    gem "gko_core"
    gem "gko_auth"
    gem "gko_documents"
    gem "gko_inquiries"
  end
end

#group :development do
#	gem "gko_core", :path => '~/Github/gko_cms3/gko_core'
#	gem "gko_auth", :path => '~/Github/gko_cms3/gko_auth'
#	gem "gko_documents", :path => '~/Github/gko_cms3/gko_documents'
#	gem "gko_inquiries", :path => '~/Github/gko_cms3/gko_inquiries'
#end
    

