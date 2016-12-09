

function createTableHeader() {
    tr = $(document.createElement('tr'))
    tr.append('<th>Time</th>')
    tr.append('<th>Original</th>')
    tr.append('<th>Expected</th>')
    tr.append('<th>Edit dist</th>')
    tr.append('<th>Suggestions</th>')

    thead = $(document.createElement('thead'))
    thead.append(tr)
    $("#demo").append(thead)
}

function createTable(xml) {
    tbody = $(document.createElement('tbody'))
    $(xml).find('word').each(function(){
        tr = $(document.createElement('tr'));
        tr.append('<td>' + $(this).find('time').text() + '</td>');
        tr.append('<td>' + $(this).find('original').text() + '</td>');
        tr.append('<td>' + $(this).find('expected').text() + '</td>');
        tr.append('<td>' + $(this).find('edit_dist').text() + '</td>');
        tr.append(createSuggestions($(this).find('suggestions')));
        tbody.append(tr)
    });
    $("#demo").append(tbody)
}

function createSuggestions(suggestions) {
    var ul = $(document.createElement('ul'));

    $(suggestions).find('suggestion').each(function() {
        $(ul).append('<li>' + $(this).text() + '</li>');
    });

    var td = $(document.createElement('td'));
    td.append(ul);

    return td;
}

$(document).ready(function () {
    $.ajax({
        type: "GET" ,
        url: "speller_result_typos.to.xml" ,
        dataType: "xml" ,
        success: function(xml) {
            createTableHeader();
            createTable(xml);
        }
    });
    $("#demo").dynatable();
});
