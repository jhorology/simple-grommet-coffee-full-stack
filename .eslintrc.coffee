module.exports =
  extends: ['plugin:@fellow/coffee/recommended']
  rules:
    '@fellow/coffee/indentation': ['error',
      value: 2
    ]
    '@fellow/coffee/braces-spacing': ['warn',
       paces: 0
       empty_object_spaces: 0
    ]
