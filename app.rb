require 'rubygems'
require 'bundler'
Bundler.setup
require 'sinatra'
require 'haml'

get '/style.css' do
  content_type 'text/css', :charset => 'utf-8'
  sass :style
end

get '/' do
  redirect '/2010/08'
end

get '/:year/:month' do
  haml "#{params[:year]}-#{params[:month]}".to_sym
end

LOREM = [
  <<END_0,
Lorem ipsum dolor sit amet, tortor a massa placerat, hendrerit perferendis pharetra risus sodales scelerisque lobortis, molestie volutpat accumsan nulla, lobortis amet, dolor amet in iaculis wisi. Orci faucibus id ullamcorper blandit. Odio enim magna, nascetur ligula ipsum nec semper nihil, elementum nec per sollicitudin, justo vestibulum sit. Sit erat libero amet ipsum proin libero, nec mattis blandit nostra sit fusce, risus tellus vivamus et, ullamcorper vitae a nec condimentum vel, augue arcu ut dolor mauris nec arcu. Mattis libero, tincidunt pellentesque faucibus non, felis et turpis lacus eget, eget amet euismod natoque nec dolor, ut libero ut tincidunt elit. Mauris luctus eu nec vestibulum, dolor risus donec eu, vel eget mauris sed.
END_0
  <<END_1,
Lobortis eros ac semper id, sit maecenas, suscipit dapibus ante arcu mollis quis. Ultrices massa in etiam maecenas tempor a, ad elit commodo. Dolor sit ultricies, pulvinar et iaculis. Tortor non mauris mauris condimentum, fringilla in sit duis. Posuere euismod ut pellentesque vehicula scelerisque quis. Ultrices adipiscing ac conubia, quis vestibulum odio, interdum semper non neque. Arcu metus posuere nunc turpis condimentum vestibulum, sem nulla pretium odio integer cras nullam, purus nibh proin egestas. Pellentesque urna proin.
END_1
  <<END_2,
Arcu tristique pellentesque elementum mi feugiat, magnis luctus consequuntur cras, mauris integer, tincidunt eros, libero augue ligula vestibulum morbi ornare. Iaculis etiam ante suspendisse convallis, voluptate turpis cursus ac integer. Sed consectetuer curae eget sapien, et lacinia in magna, sodales leo quis eros tempus a, pede voluptatem nibh non. Lacus facilisis. Imperdiet id, pulvinar sit vel a, magna ante. Lacus totam vitae, ante volutpat, sit auctor nunc quam penatibus, eget sed vestibulum in amet. Mi nulla, ac a a dis volutpat, ut a, volutpat ipsum tortor ipsum. In adipiscing eget, morbi mauris, nam sollicitudin eu eget vel torquent felis, mollis pede turpis per totam aenean tempus, id phasellus quis.
END_2
  <<END_3,
Amet nostra tincidunt lacus wisi duis maecenas, nec suspendisse lorem taciti, odio placerat a nonummy. Magna sociosqu netus, orci urna enim turpis proin, aenean tincidunt, eget urna massa vestibulum fermentum ultrices commodo, sit placerat aenean. Lacinia at lectus nulla lobortis, dui nulla, massa magnis id amet adipiscing sed, parturient nunc libero turpis in, bibendum orci et felis. Consequat urna libero, vestibulum eros eu consequat, eu ad, imperdiet cursus, a nunc est. Justo suspendisse facilisi, ultricies suspendisse metus auctor est turpis. Metus auctor porta lacus congue nibh magna, tortor congue id, morbi pellentesque elit, mauris ut curabitur. Sit augue porttitor amet massa aliquam enim, quam tempor morbi. Nibh sociis at, at interdum. Egestas ac tortor praesent duis in. Nibh tellus ante justo semper nec et, semper mauris dignissim nulla pede sit, semper mauris ullamcorper, id wisi ullamcorper posuere sodales modi. Sollicitudin sollicitudin tempor magna felis nunc, aut libero porta in vitae turpis, in mollis per, velit praesent diam mauris semper, at sed convallis id non arcu.
END_3
]
