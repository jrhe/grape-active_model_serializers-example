require 'grape'
require 'active_model_serializers'
require 'grape-active_model_serializers'

module Twitter
  class Tweet
    include ActiveModel::SerializerSupport

    attr_accessor :id, :content, :time

    def initialize(options={})
      @id = options[:id]
      @content =  options[:content]
      @time =  options[:time]
    end
  end

  class TweetSerializer < ActiveModel::Serializer
    attributes :id, :content
  end

  class API < Grape::API
    format :json
    formatter :json, Grape::Formatter::ActiveModelSerializers

    resource :tweet do
      desc "Returns a tweet"
      get :public_timeline do
        Tweet.new({id: 1, content: 'This is a tweet'})
      end
    end
  end
end
