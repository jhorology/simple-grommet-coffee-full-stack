preset = (name, opts) ->
  if opts then [name, opts] else name
plugin = (name, opts) ->
  if opts then [name, opts] else name

module.exports =
  presets: [
    preset '@babel/preset-env',
      targets:
        browsers: [
          '>1%'
          'not ie 11'
          'not op_mini all'
        ]
    preset '@babel/preset-react'
  ]
  plugins: [
  ]
