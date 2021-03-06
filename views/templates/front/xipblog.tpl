<div class="home_blog_post_area {$xipbdp_designlayout} {$hookName}">
	<div class="home_blog_post">
		<div class="page_title_area">
			{if isset($xipbdp_title)}
	
				<h3 class="page-heading">
						<a href="{$link_archive}">
					<em>{$xipbdp_title}</em>
					<span class="heading_carousel_arrow"></span>
					</a>
				</h3>
				
			{/if}
			{if isset($xipbdp_subtext)}
				<p class="page_subtitle">{$xipbdp_subtext}</p>
			{/if}
			<div class="heading-line d_none"><span></span></div>
		</div>
		<div class="row home_blog_post_inner carousel">
		{if (isset($xipblogposts) && !empty($xipblogposts))}
			{foreach from=$xipblogposts item=xipblgpst}
				<article class="blog_post col-xs-12 col-sm-4">
					<div class="blog_post_content">
						<div class="blog_post_content_top">
						<a href="{$xipblgpst.link}">
							<div class="post_thumbnail">
								{if $xipblgpst.post_format == 'video'}
									{assign var="postvideos" value=','|explode:$xipblgpst.video}
									{if $postvideos|@count > 1 }
										{include file="module:xipblog/views/templates/front/post-video.tpl" videos=$postvideos width='570' height="316" class="carousel"}
									{else}
										{include file="module:xipblog/views/templates/front/post-video.tpl" videos=$postvideos width='570' height="316" class=""}
									{/if}
								{elseif $xipblgpst.post_format == 'audio'}
									{assign var="postaudio" value=','|explode:$xipblgpst.audio}
									{if $postaudio|@count > 1 }
										{include file="module:xipblog/views/templates/front/post-audio.tpl" audios=$postaudio width='570' height="316" class="carousel"}
									{else}
										{include file="module:xipblog/views/templates/front/post-audio.tpl" audios=$postaudio width='570' height="316" class=""}
									{/if}
								{elseif $xipblgpst.post_format == 'gallery'}
									{if $xipblgpst.gallery_lists|@count > 1 }
										{include file="module:xipblog/views/templates/front/post-gallery.tpl" gallery=$xipblgpst.gallery_lists imagesize="home_default" class="carousel"}
									{else}
										{include file="module:xipblog/views/templates/front/post-gallery.tpl" gallery=$xipblgpst.gallery_lists imagesize="home_default" class=""}
									{/if}
								{else}
									<img class="xipblog_img img-responsive" src="{$xipblgpst.post_img_home_default}" alt="{$xipblgpst.post_title}">
								{/if}
							</div>
							</a>
						</div>
						<div class="blog_post_content_bottom">
							<h3 class="post_title"><a href="{$xipblgpst.link}">{$xipblgpst.post_title}</a></h3>
							<div class="post_meta clearfix">
								<p class="meta_date">
									{* <i class="icon-calendar"></i> *}
									{$xipblgpst.post_date|date_format:"%b %d, %Y"}
								</p>
								
								<p class="meta_category">
									{* <i class="icon-tag"></i> *}
									{if $xipblgpst.category_default_arr.name}
									{l s='IN' mod='xipblog'}
									<a href="{$xipblgpst.category_default_arr.link}">{$xipblgpst.category_default_arr.name}</a>
									{/if}
								</p>
							</div>
							
							<div class="post_content">
								{if isset($xipblgpst.post_excerpt) && !empty($xipblgpst.post_excerpt)}
									<p>{$xipblgpst.post_excerpt|truncate:100:' ...'|escape:'html':'UTF-8'}</p>
								{else}
									<p>{$xipblgpst.post_content|truncate:100:' ...'|escape:'html':'UTF-8'|strip_tags}</p>
								{/if}
							</div>
						</div>
					</div>
				</article>
			{/foreach}
		{else}
			<p>{l s='No Blog Post Found' mod='xipblog'}</p>
		{/if}
		</div>
	</div>
</div>