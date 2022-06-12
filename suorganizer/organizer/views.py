from django.core.urlresolvers import reverse,reverse_lazy
from webbrowser import get
from django.http.response import HttpResponse,Http404
from .models import Startup, Tag,NewsLink
from django.template import Context,loader,RequestContext
from django.shortcuts import (get_object_or_404,redirect,render)
from .forms import TagForm,StartupForm,NewsLinkForm
from django.views.generic import View
from .utils import ObjectCreateMixin, ObjectUpdateMixin,ObjectDeleteMixin


def tag_list(request):
    #try:
        #tag_list=Tag.objects.all()
    #except Tag.DoesNotExist:
        #raise Http404
    #template=loader.get_template('organizer/tag_list.html')
    #context=Context({'tag_list':tag_list})
    #context=RequestContext(request,{'tag_list':tag_list})
    #output=template.render(context)
    #return HttpResponse(output)
    #return render_to_response('organizer/tag_list.html',{'tag_list':Tag.objects.all()})
    return render(request,'organizer/tag_list.html',{'tag_list':Tag.objects.all()})

def tag_detail(request,slug):
    tag=get_object_or_404(Tag,slug__iexact=slug)
    #template=loader.get_template('organizer/tag_detail.html')
    #context=Context({'tag':tag})
    #return HttpResponse(template.render(context))
    return render(request,'organizer/tag_detail.html',{'tag':tag})

def startup_list(request):
    return render(request,'organizer/startup_list.html',{'startup_list':Startup.objects.all()})

def startup_detail(request,slug):
    startup=get_object_or_404(Startup,slug__iexact=slug)
    return render(request,'organizer/startup_detail.html',{'startup':startup})

def tag_create(request):
    if request.method=='POST':
        form=TagForm(request.POST)
        if form.is_valid():
            new_tag=form.save()
            return redirect(new_tag)
        else:
            return render(request,'organizer/tag_form.html',{'form':form})
    else:
        form=TagForm()
        return render(request,'organizer/tag_form.html',{'form':form})

class TagCreate(View,ObjectCreateMixin):
    form_class=TagForm
    template_name='organizer/tag_form.html'

   #def get(self,request):
        #return render(request,self.template_name,{'form':self.form_class()})

    #def post(self,request):
        #=self.form_class(request.POST)
        #if bound_form.is_valid():
            #new_tag=bound_form.save()
            #return redirect(new_tag)
        #else:
            #return render(request,self.template_name,{'form':bound_form})

class StartupCreate(View,ObjectCreateMixin):
    form_class=StartupForm
    template_name='organizer/startup_form.html'

    #def get(self,request):
        #return render(request,self.template_name,{'form':self.form_class()})

    #def post(self,request):
        #bound_form=self.form_class(request.POST)
        #if bound_form.is_valid():
            #new_startup=bound_form.save()
            #return redirect(new_startup)
        #else:
            #return render(request,self.template_name,{'form':bound_form})

class NewsLinkCreate(View,ObjectCreateMixin):
    form_class=NewsLinkForm
    template_name='organizer/newslink_form.html'

    #def get(self,request):
        #return render(request,self.template_name,{'form':self.form_class()})

    #def post(self,request):
        #bound_form=self.form_class(request.POST)
        #if bound_form.is_valid():
            #new_newslink=bound_form.save()
            #return redirect(new_newslink)
        #else:
            #return render(request,self.template_name,{'form':bound_form})

class NewsLinkUpdate(View):
    form_class=NewsLinkForm
    template_name='organizer/newslink_form_update.html'

    def get(self,request,pk):
        news_link=get_object_or_404(NewsLink,pk=pk)
        context={'form':self.form_class(instance=news_link),'news_link':news_link}
        return render(request,self.template_name,context)

    def post(self,request,pk):
         newslink=get_object_or_404(NewsLink,pk=pk)
         bound_form=self.form_class(request.POST,instance=newslink)

         if bound_form.is_valid():
             new_newslink=bound_form.save()
             return redirect(new_newslink)
         else:
             context={'form':bound_form,'newslink':newslink}
             return render(request,self.template_name,context)

class TagUpdate(ObjectUpdateMixin,View):
    form_class=TagForm
    model=Tag
    template_name='organizer/tag_form_update.html'

class StartupUpdate(ObjectUpdateMixin,View):
    form_class=StartupForm
    model=Startup
    template_name='organizer/startup_form_update.html'

class NewsLinkDelete(View):
    def get(self,request,pk):
        newslink=get_object_or_404(NewsLink,pk=pk)
        return render(request,'organizer/newslink_confirm_delete.html',{'newslink':newslink})

    def post(self,request,pk):
        newslink=get_object_or_404(NewsLink,pk=pk)
        startup=newslink.startup
        newslink.delete()
        return redirect(startup)

class TagDelete(View,ObjectDeleteMixin):
    model=Tag
    success_url=reverse_lazy('organizer_tag_list')
    template_name='organizer/tag_confirm_delete.html'

class StartupDelete(View,ObjectDeleteMixin):
    model=Startup
    success_url=reverse_lazy('organizer_startup_list')
    template_name='organizer/startup_confirm_delete.html'
