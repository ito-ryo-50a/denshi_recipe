const { iconsPlugin, getIconCollections } = require("@egoist/tailwindcss-icons");

module.exports = {
  content: [
    './app/views/**/*.html.erb',
    './app/views/**/*.html.slim',
    './app/helpers/**/*.rb',
    './app/assets/stylesheets/**/*.css',
    './app/javascript/**/*.js'
  ],
  plugins: [
    require('daisyui'),
    iconsPlugin({
      collections: getIconCollections(["mdi", "lucide"])
    }),
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
        'app-background-contrast': '#FAF5ED',
        'app-danger': '#FF0000',
        'app-success': '17DB4E',
        'app-alert': '#FAB515',
        'app-already': '#66BB6A',
        'app-already-border': '#C8E6C9',
        'app-cancel': '#D32F2F',
        'app-cancel-border': '#FFCDD2',
        'app-edit': '#FF9800',
        'app-edit-border': '#FFB74D',
        'app-inactive': '#BDBDBD',
        'app-inactive-border': '#E0E0E0',
        'app-other-cancel': '#F4F4F4',
        'app-other-cancel-border': '#E0E0E0',
        'app-other-cancel-text': '#555555',
        'header-footer': '#FAEBD4',
      },
    },
  },
}
