require 'spec_helper'

include HtmlHelpers

describe "wicked_core" do
  it "Generate pdf with complete html" do
    html = import_sample_html
    result = WickedCore.new
    pdf = result.export(html, {})
    expect(pdf.class).to eq(String)
  end

  it "Generate pdf without complete html" do
    html = ''
    result = WickedCore.new
    pdf = result.export(html, {})
    expect(pdf.class).to eq(String)
  end

  it "export pdf" do
    html = import_sample_html
    options = import_sample_option
    result = PdfReports.export(html, options)
  end
end