def clear_trix_editor
  find('trix-editor').click.set(' ').send_keys(:backspace)
end

def fill_in_trix_editor(content)
  find('trix-editor').click.set(content)
end
