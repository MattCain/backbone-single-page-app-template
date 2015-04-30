# Globbing
# for performance reasons we're only matching one level down:
# 'test/spec/{,*/}*.js'
# use this if you want to recursively match all subfolders:
# 'test/spec/**/*.js'

module.exports = (grunt) ->
    # show elapsed time at the end
    require('time-grunt')(grunt)
    # load all grunt tasks
    require('load-grunt-tasks')(grunt)

    grunt.initConfig(
        # configurable paths
        yeoman:
            app: 'app',
            dist: 'dist'

        watch:
            less:
                files: ['<%= yeoman.app %>/styles/{,*/}*.less']
                tasks: ['less', 'autoprefixer']
            coffee:
                files: ['<%= yeoman.app %>/coffee/{,*/}*.coffee']
                tasks: ['coffee:server', 'coffeelint:server']
            styles:
                files: ['<%= yeoman.app %>/styles/{,*/}*.css']
                tasks: ['copy:styles', 'autoprefixer']
            livereload:
                options:
                    livereload: '<%= connect.options.livereload %>'
                files: [
                    '<%= yeoman.app %>/*.html',
                    '.tmp/styles/{,*/}*.css',
                    '{.tmp,<%= yeoman.app %>}/scripts/{,*/}*.js',
                    '<%= yeoman.app %>/coffee/{,*/}*.coffee',
                    '<%= yeoman.app %>/images/{,*/}*.{gif,jpeg,jpg,png,svg,webp}'
                ]
            handlebars:
                files: '{.tmp,<%= yeoman.app %>}/templates/{,*/}*.hbs'
                tasks: ['handlebars:server']

        connect:
            options:
                port: 9001
                livereload: 35729
                # change this to '0.0.0.0' to access the server from outside
                hostname: 'localhost'
            livereload:
                options:
                    open: true
                    base: [
                        '.tmp',
                        '<%= yeoman.app %>'
                    ]
            test:
                options:
                    base: [
                        '.tmp',
                        'test',
                        '<%= yeoman.app %>'
                    ]
            dist:
                options:
                    open: true
                    base: '<%= yeoman.dist %>'
                    livereload: false

        clean:
            dist:
                files: [
                    dot: true
                    src: [
                        '.tmp',
                        '<%= yeoman.dist %>/*',
                        '!<%= yeoman.dist %>/.git*'
                    ]
                ]
            server: '.tmp'

        mocha:
            all:
                options:
                    run: true
                    urls: ['http://<%= connect.test.options.hostname %>:<%= connect.test.options.port %>/index.html']
        less:
            all:
                files: [
                   expand: true
                   cwd: "<%= yeoman.app %>/styles"
                   src: ["*.less"]
                   dest: ".tmp/styles/"
                   ext: ".css"
                ]

        autoprefixer:
            options:
                browsers: ['last 1 version']
            dist:
                files: [
                    expand: true
                    cwd: '.tmp/styles/'
                    src: '{,*/}*.css'
                    dest: '.tmp/styles/'
                ]
        
        'bower-install':
            app:
                html: '<%= yeoman.app %>/index.html'
                ignorePath: '<%= yeoman.app %>/'

        rev:
            dist:
                files:
                    src: [
                        '<%= yeoman.dist %>/scripts/{,*/}*.js',
                        '<%= yeoman.dist %>/styles/{,*/}*.css',
                        '<%= yeoman.dist %>/images/{,*/}*.{gif,jpeg,jpg,png,webp}',
                        '<%= yeoman.dist %>/styles/fonts/{,*/}*.*'
                    ]

        useminPrepare:
            options:
                dest: '<%= yeoman.dist %>'
            html: '<%= yeoman.app %>/index.html'

        usemin:
            options:
                assetsDirs: ['<%= yeoman.dist %>', '<%= yeoman.dist %>/images']
                patterns:
                    js: [
                        [/(images\/.*?\.(?:gif|jpeg|jpg|png|webp))/gm, 'Update the JS to reference our revved images']
                    ]
            html: ['<%= yeoman.dist %>/{,*/}*.html']
            css: ['<%= yeoman.dist %>/styles/{,*/}*.css']
            js: ['<%= yeoman.dist %>/scripts/{,*/}*.js']

        imagemin:
            dist:
                files: [
                    expand: true
                    cwd: '<%= yeoman.app %>/images'
                    src: '{,*/}*.{gif,jpeg,jpg,png}'
                    dest: '<%= yeoman.dist %>/images'
                ]

        svgmin:
            dist:
                files: [
                    expand: true
                    cwd: '<%= yeoman.app %>/images'
                    src: '{,*/}*.svg'
                    dest: '<%= yeoman.dist %>/images'
                ]

        htmlmin:
            dist:
                files: [
                    expand: true
                    cwd: '<%= yeoman.app %>'
                    src: '*.html'
                    dest: '<%= yeoman.dist %>'
                ]

        # Put files not handled in other tasks here
        copy:
            dist:
                files: [
                    expand: true
                    dot: true
                    cwd: '<%= yeoman.app %>'
                    dest: '<%= yeoman.dist %>'
                    src: [
                        '*.{ico,png,txt}'
                        '.htaccess'
                        'images/{,*/}*.{webp,gif}'
                        'styles/fonts/{,*/}*.*'
                        'bower_components/sass-bootstrap/fonts/*.*'
                    ]
                ]
            styles:
                expand: true
                dot: true
                cwd: '<%= yeoman.app %>/styles'
                dest: '.tmp/styles/'
                src: '{,*/}*.css'

        modernizr:
            devFile: '<%= yeoman.app %>/bower_components/modernizr/modernizr.js'
            outputFile: '<%= yeoman.dist %>/bower_components/modernizr/modernizr.js'
            files: [
                '<%= yeoman.dist %>/scripts/{,*/}*.js',
                '<%= yeoman.dist %>/styles/{,*/}*.css',
                '!<%= yeoman.dist %>/scripts/vendor/*'
            ],
            uglify: true

        handlebars:
            server:
                options:
                    namespace: 'App.templates',
                    # Name the template after the name of the file.
                    processName: (filepath) ->
                        split = filepath.replace('.hbs', '').split('/')
                        
                        split[split.length - 1]

                files:
                    '.tmp/scripts/templates.js': '<%= yeoman.app %>/templates/*.hbs'
            dist:
                options:
                    namespace: 'App.templates'
                    seperator: ''
                    wrapped: true
                    processName: (filepath) ->
                        split = filepath.replace('.hbs', '').split('/')
                        
                        split[split.length - 1]

                    # Remove template whitespace from the js file.
                    processContent: (content) ->
                        content.replace(/\s{2,}/g, ' ').replace(new RegExp( '\\>[\n\t ]+\\<' , 'g' ) , '><')

                files:
                    '.tmp/scripts/templates.js': '<%= yeoman.app %>/templates/index/*.hbs'
        
        coffee:
            server:
                expand: true
                flatten: false
                cwd: '<%= yeoman.app %>/coffee'
                src: ['{,*/}*.coffee']
                dest: '<%= yeoman.app %>/scripts'
                ext: '.js'
            dist:
                expand: true
                flatten: false
                cwd: '<%= yeoman.app %>/coffee'
                src: ['{,*/}*.coffee']
                dest: '<%= yeoman.dist %>/scripts'
                ext: '.js'

        coffeelint:
            options:
                indentation:
                    value: 4
                max_line_length:
                    value: 120
            server:
                options:
                    force: true
                files:
                    src: ['<%= yeoman.app %>/coffee/{,*/}*.coffee', 'Gruntfile.coffee']

            dist: ['coffee/{,*/}*.coffee', 'Gruntfile.coffee']

        concurrent:
            server: [
                'less',
                'copy:styles',
                'coffeelint:server',
                'coffee:server',
                'handlebars:server'
            ]
            test: [
                'copy:styles'
            ]
            dist: [
                'less',
                'copy:styles',
                'coffeelint:dist',
                'coffee:dist',
                'imagemin',
                'svgmin',
                'htmlmin'
            ]
    )

    grunt.registerTask('serve', (target) ->
        if target is 'dist'
            return grunt.task.run(['build', 'connect:dist:keepalive'])

        grunt.task.run([
            'clean:server',
            'concurrent:server',
            'autoprefixer',
            'connect:livereload',
            'watch'
        ])
    )

    grunt.registerTask('server', ->
        grunt.log.warn('The `server` task has been deprecated. Use `grunt serve` to start a server.')
        grunt.task.run(['serve'])
    )

    grunt.registerTask('test', [
        'clean:server',
        'concurrent:test',
        'autoprefixer',
        'connect:test',
        'mocha'
    ])

    grunt.registerTask('build', [
        'clean:dist',
        'handlebars:dist',
        'useminPrepare',
        'concurrent:dist',
        'autoprefixer',
        'concat',
        'cssmin',
        'uglify',
        'modernizr',
        'copy:dist',
        'rev',
        'usemin'
    ])

    grunt.registerTask('default', [
        'jshint',
        'test',
        'build'
    ])
