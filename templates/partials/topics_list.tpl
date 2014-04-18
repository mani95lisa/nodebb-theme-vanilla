		<ul id="topics-container" data-nextstart="{nextStart}">
			<!-- BEGIN topics -->
			<li class="category-item<!-- IF topics.deleted --> deleted<!-- ENDIF topics.deleted --><!-- IF topics.unread --> unread<!-- ENDIF topics.unread -->" data-tid="{topics.tid}" data-cid="{topics.cid}">
				<div class="col-md-12 col-xs-12 panel panel-default topic-row">

					<!-- IF showSelect -->
					<i class="fa fa-fw fa-square-o pull-left select pointer"></i>
					<!-- ENDIF showSelect -->

					<a href="{relative_path}/user/{topics.user.userslug}" class="pull-left">
						<img class="img-rounded user-img" src="{topics.user.picture}" title="{topics.user.username}" />
					</a>

					<h3>
						<a href="{relative_path}/topic/{topics.slug}">
							<strong><!-- IF topics.pinned --><i class="fa fa-thumb-tack"></i><!-- ENDIF topics.pinned --> <!-- IF topics.locked --><i class="fa fa-lock"></i><!-- ENDIF topics.locked --></strong>
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
							[[category:posted]] [[global:in]]
							<a href="{relative_path}/category/{topics.category.slug}"><i class="fa {topics.category.icon}"></i> {topics.category.name}</a>
							<span class="timeago" title="{topics.relativeTime}"></span>
							</span>
						</span>

						<span class="pull-right">
							<!-- IF topics.unreplied -->
							[[category:no_replies]]
							<!-- ELSE -->
							<a href="{relative_path}/user/{topics.teaser.userslug}">
								<img class="teaser-pic" src="{topics.teaser.picture}" title="{topics.teaser.username}"/>
							</a>
							<a href="{relative_path}/topic/{topics.slug}#{topics.teaser.pid}">
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