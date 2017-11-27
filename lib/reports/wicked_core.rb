require 'nokogiri'
require 'wicked_pdf'

class WickedCore
  include ActionView::Helpers::TagHelper

  C_CLASS_NAME = "WickedCore"
  C_FIRST_PAGE = 5
  C_PER_PAGE = 9

  def initialize
    @html = ""
    @paper_size = ""
  end

  def self.root_path
    String === Rails.root ? Pathname.new(Rails.root) : Rails.root
  end

  def self.add_extension(filename, extension)
    filename.to_s.split('.').include?(extension) ? filename : "#{filename}.#{extension}"
  end

  # Get the PDF
  #
  # @return [Object] The PDF document
  def pdf
    footer =
        {
            :font_size => "8",
            :font_name => "Arial, \"Helvetica Neue\", Helvetica, sans-serif",
            :left => "",
            :center => "",
            :right => "[page] of [topage]"
        }
    pdf = WickedPdf.new.pdf_from_string(@html, :page_size => @paper_size, :footer => footer)
    return pdf
  end

  # Return the current HTML.
  #
  # @return [String] The HTML
  def html
    return @html
  end

  def export(html, options)
    pdf = WickedPdf.new.pdf_from_string(html, options)
  end

  def self.report_asset_path(asset)
    return WickedCore.root_path.join('.', 'public').to_s + asset
  end
end
