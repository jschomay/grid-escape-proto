function include(includes)
{
    if ( typeof($('head').data('included')) == 'undefined' )
    {
        $('head').data('included', []);
    }

    for ( var i = 0; i < includes.length; i++ )
    {
        if ( $.inArray(includes[i], $('head').data('included')) === -1 )
        {
            $('head').append(
                '<script type="text/javascript" src="js/'+includes[i]+'"></script>'
            );

            $('head').data('included').push(includes[i]);
        }
    }
}