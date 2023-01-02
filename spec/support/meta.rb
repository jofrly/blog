def have_meta(name, content)
  have_css "meta[name='#{name}'][content='#{content}']", visible: :hidden
end
