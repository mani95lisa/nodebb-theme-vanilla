
<input type="hidden" template-variable="category_id" value="{cid}" />
<input type="hidden" template-variable="category_name" value="{name}" />
<input type="hidden" template-variable="topic_count" value="{topic_count}" />
<input type="hidden" template-variable="currentPage" value="{currentPage}" />
<input type="hidden" template-variable="pageCount" value="{pageCount}" />

<ol class="breadcrumb">
	<li itemscope="itemscope" itemtype="http://data-vocabulary.org/Breadcrumb">
		<a href="{relative_path}/" itemprop="url"><span itemprop="title">[[global:home]]</span></a>
	</li>
	<li class="active" itemscope="itemscope" itemtype="http://data-vocabulary.org/Breadcrumb">
		<span itemprop="title">{name} <a target="_blank" href="../{cid}.rss"><i class="fa fa-rss-square"></i></a></span>
	</li>
</ol>

<div class="category row">
	<div class="{topic_row_size}" no-widget-class="col-lg-12 col-sm-12" no-widget-target="sidebar">

		<div class="header" class="category-tools">
			<!-- IF privileges.write -->
			<button id="new_post" class="btn btn-primary">[[category:new_topic_button]]</button>
			<!-- ENDIF privileges.write -->

			<span class="pull-right">
				<!-- IMPORT partials/thread_tools.tpl -->

				<div class="dropdown share-dropdown inline-block">
					<button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown">
						[[topic:share]] <span class="caret"></span>
					</button>

					<!-- IMPORT partials/share_dropdown.tpl -->
				</div>
			</span>

		</div>

		<!-- IF !topics.length -->
		<div class="alert alert-warning" id="category-no-topics">
			[[category:no_topics]]
		</div>
		<!-- ENDIF !topics.length -->

		<ul id="topics-container" itemscope itemtype="http://www.schema.org/ItemList" data-nextstart="{nextStart}">
			<meta itemprop="itemListOrder" content="descending">
			<!-- BEGIN topics -->
			<li class="category-item<!-- IF topics.locked --> locked<!-- ENDIF topics.locked --><!-- IF topics.pinned --> pinned<!-- ENDIF topics.pinned --><!-- IF topics.deleted --> deleted<!-- ENDIF topics.deleted --><!-- IF topics.unread --> unread<!-- ENDIF topics.unread -->" itemprop="itemListElement" data-tid="{topics.tid}" data-index="{topics.index}">

				<div class="col-md-12 col-xs-12 panel panel-default topic-row">

					<a href="../../user/{topics.user.userslug}" class="pull-left">
						<img src="<!-- IF topics.thumb -->{topics.thumb}<!-- ELSE -->{topics.user.picture}<!-- ENDIF topics.thumb -->" class="img-rounded user-img" title="{topics.user.username}"/>
					</a>

					<h3>
						<a href="../../topic/{topics.slug}" itemprop="url">
							<meta itemprop="name" content="{topics.title}">

							<strong><i class="fa fa-thumb-tack<!-- IF !topics.pinned --> hide<!-- ENDIF !topics.pinned -->"></i> <i class="fa fa-lock<!-- IF !topics.locked --> hide<!-- ENDIF !topics.locked -->"></i></strong>
							<span class="topic-title">{topics.title}</span>
						</a>
					</h3>

					<small>
						<span class="topic-stats">
							[[global:posts]]
							<strong class="human-readable-number" title="{topics.postcount}">{topics.postcount}</strong>
						</span>
						|
						<span class="topic-stats">
							[[global:views]]
							<strong class="human-readable-number" title="{topics.viewcount}">{topics.viewcount}</strong>
						</span>
						|
						<span>
							[[category:posted]] <span class="timeago" title="{topics.relativeTime}"></span>
						</span>

						<span class="pull-right">
							<!-- IF topics.unreplied -->
							[[category:no_replies]]
							<!-- ELSE -->
							<a href="../../user/{topics.teaser.userslug}">
								<img class="teaser-pic" src="{topics.teaser.picture}" title="{topics.teaser.username}"/>
							</a>
							<a href="../../topic/{topics.slug}#{topics.teaser.pid}">
								[[category:replied]]
							</a>
							<span class="timeago" title="{topics.teaser.timestamp}"></span>
							<!-- ENDIF topics.unreplied -->
						</span>
					</small>

				</div>

			</li>
			<!-- END topics -->
		</ul>
		<!-- IF config.usePagination -->
		<div class="text-center">
			<ul class="pagination">
				<li class="previous pull-left"><a href="#"><i class="fa fa-chevron-left"></i> [[global:previouspage]]</a></li>
				<li class="next pull-right"><a href="#">[[global:nextpage]] <i class="fa fa-chevron-right"></i></a></li>
			</ul>
		</div>
		<!-- ENDIF config.usePagination -->
	</div>

	<!-- IF topics.length -->
	<div widget-area="sidebar" class="col-md-3 col-xs-12 category-sidebar"></div>
	<!-- ENDIF topics.length -->
</div>

<!-- IMPORT partials/move_thread_modal.tpl -->
<!-- IMPORT partials/noscript/paginator.tpl -->