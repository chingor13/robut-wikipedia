require 'robut'
require 'wikipedia'
require 'nokogiri'

class Robut::Plugin::Wikipedia
  include Robut::Plugin
  WIKI_REGEX = /^wiki (.*)$/

  def usage
    [
      "#{at_nick} wiki [page-slug]"
    ]
  end

  def handle(time, sender_nick, message)

    if sent_to_me?(message) && match = message.match(WIKI_REGEX)
      process_response_for(match[1])
    end

  end

  def process_response_for(query)
    page_slug = query.strip.gsub(/\s/, "_")
    page = ::Wikipedia.find(page_slug)

    content = page.content
    if content.nil?
      reply("Couldn't find a page for: '#{page_slug}'")
      return
    end

    doc = Nokogiri::HTML(page.sanitized_content)
    reply("Wikipedia result for '#{page.title}'")
    reply(doc.search('p:first-child').text)

    if image = page.image_urls.first
      reply(image)
    end

  end

end