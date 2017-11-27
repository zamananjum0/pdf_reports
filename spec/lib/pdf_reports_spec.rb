require 'spec_helper'

include HtmlHelpers

describe "pdf_reports" do
  it "export pdf reports" do
    html = import_sample_html
    options = import_sample_option
    result = PdfReports.export(html, options)

  end
end
