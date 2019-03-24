module.exports =
  extends: ['plugin:@fellow/coffee/recommended']
  rules:
    '@fellow/coffee/indentation': ['error',
      value: 2
    ]
    '@fellow/coffee/braces-spacing': ['warn',
       spaces: 0
       empty_object_spaces: 0
    ]
