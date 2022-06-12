from django.conf.urls import include, url
from django.contrib import admin
from organizer import urls as organizer_urls
from blog import urls as blog_urls
from contact import urls as contact_urls
from .views import redirect_root
from organizer.urls import (startup as startup_urls, tag as tag_urls)

urlpatterns = [
    # Examples:
    # url(r'^$', 'suorganizer.views.home', name='home'),
    # url(r'^blog/', include('blog.urls')),
    url(r'^$',redirect_root),
    url(r'^admin/', include(admin.site.urls)),
    #url(r'^',include(organizer_urls)),
    url(r'^startup/', include(startup_urls)),
    url(r'^tag/', include(tag_urls)),
    url(r'^blog/',include(blog_urls)),
    url(r'^contact/',include(contact_urls))
]
