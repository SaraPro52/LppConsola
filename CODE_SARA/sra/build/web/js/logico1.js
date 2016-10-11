    $(document).on('ready', function () {
        console.log("Vivo??Logico");
        $(function () {
            $.localise('ui-multiselect', {/*language: 'en',*/ path: 'js/locale/'});
            $(".multiselect").multiselect();
            $('#switcher').themeswitcher();
        });
    });