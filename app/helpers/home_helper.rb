module HomeHelper
  def cv_section(title, &content)
    render(layout: 'cv_section', locals: {title: title}) { capture(&content) }
  end

  def job_period(job)
    end_date = job.end_date.present? ? l(job.end_date, format: :short) : 'Present'
    "#{l job.start_date, format: :short} &mdash; #{end_date}".html_safe
  end
end
