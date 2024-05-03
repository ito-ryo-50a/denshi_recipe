module.exports = {
  content: [
    './app/views/**/*.html.erb',
    './app/views/**/*.html.slim',
    './app/helpers/**/*.rb',
    './app/assets/stylesheets/**/*.css',
    './app/javascript/**/*.js'
  ],
  plugins: [
    require('daisyui')
  ],
  daisyui: {
    darkTheme: false,
    themes: [
      {
        'mytheme': {
          'primary': '#FC7400',
          'secondary': '#695954',
          'background': '#F9F7F4',
          'surface': '#FFFFFF',
          'error': '#FF0000',
          'success': '#17DB4E',
          'warning': '#FAB515',
        },
      }
    ]
  },
  theme: {
    extend: {
      colors: {
        'app-primary': '#FC7400',
        'app-primary-contrast': '#FFFFFF',
        'app-secondary': '#695954',
        'app-surface': '#FFFFFF',
        'app-background': '#F9F7F4',
        'app-danger': '#FF0000',
        'app-success': '17DB4E',
        'app-alert': '#FAB515',
      },
    },
  },
}
