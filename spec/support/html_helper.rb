module HtmlHelpers

  def  generate_title
    return "Glandon Study Builder"
  end

  def  generate_sub_title
    return "Report"
  end

  def  generate_user
    return nil
  end

  def import_sample_html    
    html = page_header()
    html += title_page(generate_title, generate_sub_title, generate_user)
    # Document history
    html += body_html
    # Completion instructions
    html += page_footer()    
  end

  def import_sample_option
    paper_size = "A4"
    options = { :page_size => paper_size, :footer => {:font_size => "10", :font_name => "Arial, \"Helvetica Neue\", Helvetica, sans-serif", :left => "", :center => "", :right => "[page] of [topage]"} }  
  end

  def import_sample_result
    return {
    }
  end

  def page_header
    html = "<html><head>"
    html += "<style>"
    html += "h1 { font-family: Arial, \"Helvetica Neue\", Helvetica, sans-serif; font-size: 24pt; line-height: 34pt; }\n"
    html += "h1.title { font-family: Arial, \"Helvetica Neue\", Helvetica, sans-serif; font-size: 24pt; line-height: 30pt; text-align: center; margin-top: 0; }\n"
    html += "h2 { font-family: Arial, \"Helvetica Neue\", Helvetica, sans-serif; font-size: 18pt; line-height: 28pt; }\n"
    html += "h2.title { font-family: Arial, \"Helvetica Neue\", Helvetica, sans-serif; font-size: 18pt; line-height: 24pt; text-align: center; margin-top: 0; }\n"
    html += "h3 { font-family: Arial, \"Helvetica Neue\", Helvetica, sans-serif; font-size: 16pt; }\n"
    html += "h4 { font-family: Arial, \"Helvetica Neue\", Helvetica, sans-serif; font-size: 14pt; }\n"
    html += "h5 { font-family: Arial, \"Helvetica Neue\", Helvetica, sans-serif; font-size: 12pt; }\n"
    html += "p { font-family: Arial, \"Helvetica Neue\", Helvetica, sans-serif; font-size: 10pt; }\n"
    html += "table tr td { font-family: Arial, \"Helvetica Neue\", Helvetica, sans-serif; font-size: 10pt; text-align: left; vertical-align: top; padding: 5px;}\n"
    html += "table.simple { border: 1px solid black; border-collapse: collapse; width: 100%;}\n"
    html += "table.simple tr td { border: 1px solid black; font-family: Arial, \"Helvetica Neue\", Helvetica, sans-serif; font-size: 10pt; text-align: left; vertical-align: top; padding: 5px;}\n"
    html += "table.simple tr th { border: 1px solid black; font-family: Arial, \"Helvetica Neue\", Helvetica, sans-serif; font-size: 10pt; text-align: left; vertical-align: top; padding: 5px;}\n"
    html += "table.form_table { border: 1px solid black; width: 100%;}\n"
    html += "table.form_table tr td { font-family: Arial, \"Helvetica Neue\", Helvetica, sans-serif; font-size: 10pt; text-align: left; vertical-align: top; padding: 5px;}\n"
    html += "table.form_table h4 { vertical-align: middle;}\n"
    html += "table.form_table td:first-child{ font: bold; }\n"
    html += "table.form_repeat { border: 1px solid black; width: 100%;}\n"
    html += "table.form_repeat th { font-family: Arial, \"Helvetica Neue\", Helvetica, sans-serif; font-size: 10pt; text-align: left; vertical-align: top; }\n"
    html += "table.form_repeat tr td { font-family: Arial, \"Helvetica Neue\", Helvetica, sans-serif; font-size: 10pt; text-align: left; vertical-align: top;}\n"
    html += "table.details tr td { font-family: Arial, \"Helvetica Neue\", Helvetica, sans-serif; font-size: 11pt; text-align: left; vertical-align: top; padding: 1px; }\n"
    html += "table.ci { border: 1px solid black; width: 100%; border-collapse: collapse;}\n"
    html += "table.ci tr td { font-family: Arial, \"Helvetica Neue\", Helvetica, sans-serif; font-size: 10pt; text-align: left; vertical-align: top; padding: 5px; border-bottom: 1pt solid black; }\n"
    html += ".ci td table, .ci td table tbody, .ci td table td { border:none; }\n" # Stops inheritence into markdown
    html += "table.note { border: 1px solid black; width: 100%;}\n"
    html += "table.note tr td { font-family: Arial, \"Helvetica Neue\", Helvetica, sans-serif; font-size: 10pt; font: bold; text-align: left; vertical-align: top; }\n"
    html += "table.input_field { border-left: 1px solid black; border-right: 1px solid black; border-bottom: 1px solid black;}\n"
    html += "table.input_field tr td { font-family: Arial, \"Helvetica Neue\", Helvetica, sans-serif; font-size: 8pt; text-align: center; vertical-align: center; padding: 5px; }\n"
    html += "table.input_field td:not(:last-child){border-right: 1px dashed}\n"
    html += "table.cl_field tr td { font-family: Arial, \"Helvetica Neue\", Helvetica, sans-serif; font-size: 10pt; text-align: left; vertical-align: center; padding: 2px; }\n"
    html += "table.cl_field td:first-child{ border: 1px solid black; }\n"
    html += "tr.warning { background-color: #fcf8e3 !important; }\n"
    html += "</style>"
    html += "</head><body>"
    return html
  end

  def page_footer
    html = "</body></html>"
    return html
  end

  def title_page(title, sub_title, user)
    name = "A3 Informatics"
    image_file = "a3.jpg"
    dir = "app/assets/images/"
    file = File.join(dir, image_file)
    time_generated = Time.now
    # Generate HTML
    html = "<br><br><div style=\"text-align: center;\"><img src=\"#{file}\" style=\"height:75px;\"></div>"
    html += "<h2 class=\"title\">#{name}</h2>"
    html += "<br>" * 10
    html += "<h1 class=\"title\">#{title}<br>#{sub_title}</h1>"
    html += "<br>" * 23
    #html += "<table class=\"details\" align=\"right\"><tr><td>Run at:</td><td>#{time_generated.strftime("%Y-%b-%d, %H:%M:%S")}</td></tr><tr><td>Run by:</td><td>#{user.email}</td></tr></table>"
    html += page_break
    return html
  end

  def page_break
    return "<p style='page-break-after:always;'></p>"
  end

  def body_html
    return '<table class="table table-striped table-bordered table-condensed">
    <tbody><tr><td colspan="2"><h4>Informed Consent (Pilot)</h4></td><td>
    </td></tr><tr><td colspan="3"><h5> </h5></td></tr><tr><td colspan="3">
    <h5>Informed Consent</h5></td></tr><tr><td>Date patient and caregiver signed 
    the consent document</td><td></td><td><table class="crf-input-field"><tbody>
    <tr><td>D</td><td>D</td><td>/</td><td>M</td><td>M</td><td>M</td><td>/</td>
    <td>Y</td><td>Y</td><td>Y</td><td>Y</td><td></td><td>H</td><td>H</td><td>:</td>
    <td>M</td><td>M</td></tr></tbody></table></td></tr></tbody></table>'
  end
end
