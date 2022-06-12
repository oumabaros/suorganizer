from django.http import HttpResponseRedirect
from django.shortcuts import redirect
from django.core.urlresolvers import reverse

def redirect_root(request):
    #return HttpResponseRedirect('/blog/')
    #return redirect('/blog/')
    #return redirect('blog_post_list')
    url_path = reverse('blog_post_list')
    #return HttpResponseRedirect(url_path)
    return redirect(url_path)