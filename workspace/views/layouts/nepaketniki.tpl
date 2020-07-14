<html>
{include file="{$workspace_dir}/assets/nepaketniki.tpl"}
<head>
    {$smarty.capture.meta}
    <title>{$title}</title>
    {$meta}
    {$smarty.capture.css}
    {$css}
    {$smarty.capture.js_head}
    {$jsHead}
</head>
<body>
{$content}

{$smarty.capture.js_body}
    <script src="resources/js/script.js"></script>
{$jsEndBody}
</body>
</html>