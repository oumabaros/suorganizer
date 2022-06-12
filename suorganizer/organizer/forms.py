from django import forms
from .models import NewsLink, Startup, Tag
from django.core.exceptions import ValidationError
from .utils import SlugCleanMixin

class TagForm(forms.ModelForm,SlugCleanMixin):
#class TagForm(forms.Form):
    #name=forms.CharField(max_length=31)
    #slug=forms.SlugField(max_length=31,help_text='A label for URL config.')

    #def save(self):
        #new_tag=Tag.objects.create(name=self.cleaned_data['name'],slug=self.cleaned_data['slug'])
        #return new_tag
    class Meta:
        model=Tag
        fields='__all__'
        #exclude=tuple()
        #fields=['name','slug']
        #exclude=['slug]
    
    def clean_name(self):
        return self.cleaned_data['name'].lower()
    
class NewsLinkForm(forms.ModelForm):
    class Meta:
        model=NewsLink
        fields='__all__'

class StartupForm(forms.ModelForm,SlugCleanMixin):
    class Meta:
        model=Startup
        fields='__all__'
    

