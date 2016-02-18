$.rails.allowAction = (link) ->
  return true unless link.attr('data-confirm')
  $.rails.showConfirmDialog(link) # look below for implementations
  false # always stops the action since code runs asynchronously

$.rails.confirmed = (link) ->
  link.removeAttr('data-confirm')
  link.trigger('click.rails')

$.rails.showConfirmDialog = (link) ->
    swal {
      title: 'Are you sure?'
      text: ''
      type: 'warning'
      showCancelButton: true
      confirmButtonColor: '#DD6B55'
      confirmButtonText: 'Delete'
      cancelButtonText: 'Cancel'
      closeOnConfirm: false
      closeOnCancel: true
    }, (isConfirm) ->
      if isConfirm
        return $.rails.confirmed link
        # swal 'Deleted!', 'Student has been deleted!.', 'success', $.rails.confirmed link
      # else
      #   swal 'Cancelled', 'Student delete has been cancelled', 'error'
      return
