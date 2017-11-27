class PdfReports

  C_CLASS_NAME = "PdfReports"
  C_FIRST_PAGE = 5
  C_PER_PAGE = 9

  # Create the PDF report
  #
  # @param [Hash] results the results hash
  # @param [Hash] cls the code lists
  # @param [User] user the user
  # @return [String] the HTML
  def create(results, cls, user, complete_html = false)
    @report = WickedCore.new
    @report.open(results, cls, "PDF Report", "", [], user, complete_html)
    @report.close unless complete_html
    return @report.html
  end

  # Export the report
  #
  # @param [String] html the complete html
  # @param [Hash] options  export options
  # @return [String] export status
  def self.export(html, options = {})
    WickedCore.new.export(html, options)
  end
end
