---
---
class window.Retina
  constructor: (targets) ->
    # Only execute when the window is retina:
    if @isRetina()
      # Make sure all targets have a [data-retina] present
      targets = targets

      # Loop through targets
      for target in targets
        if typeof target.dataset.retina isnt 'undefined'
          console.log size = [target.clientHeight, target.clientWidth]
          retinaImage = target.dataset.retina

          target.height = size[0]
          target.width = size[1]
          # Change the image only if it's different
          target.dataset.original = target.attributes.src.value if not target.dataset.hasOwnProperty('original')
          target.src = retinaImage if target.attributes.src.value != retinaImage

  # Checks if the current user is Retina display or not
  isRetina: ->
    mediaQuery = "(-webkit-min-device-pixel-ratio: 1.5),
                  (min--moz-device-pixel-ratio: 1.5),
                  (-o-min-device-pixel-ratio: 3/2),
                  (min-resolution: 1.5dppx)"
    if window.devicePixelRatio > 1
      return true
    if window.matchMedia and window.matchMedia(mediaQuery).matches
      return true

    return false
