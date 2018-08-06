( function _Reroot_s_() {

'use strict';

if( typeof module !== 'undefined' )
{

  if( !_global_.wTools.FileProvider.Partial )
  require( './aPartial.s' );

}

var _global = _global_;
var _global = _global_; var _ = _global_.wTools;
_.assert( !_.FileFilter.Reroot );

// _.FileFilter = _.FileFilter || Object.create( null );
// // _.assert( !_.FileFilter.Reroot );
// if( _.FileFilter.Reroot )
// return;

//

var _global = _global_; var _ = _global_.wTools;
var Abstract = _.FileProvider.Abstract;
var Partial = _.FileProvider.Partial;
var Default = _.FileProvider.Default;
var Parent = null;
var Self = function wFileFilterReroot( o )
{
  if( !( this instanceof Self ) )
  if( o instanceof Self )
  return o;
  else
  return new( _.routineJoin( Self, Self, arguments ) );
  return Self.prototype.init.apply( this,arguments );
}

Self.shortName = 'Reroot';

//

function init( o )
{
  var self = this;

  _.assert( arguments.length === 1, 'expects single argument' );
  _.instanceInit( self );
  Object.preventExtensions( self );

  if( o )
  self.copy( o );

  _.assert( _.objectIs( self.original ) );

  var self = _.proxyMap( self, self.original );

  return self;
}

//

function pathNativize( filePath )
{
  var self = this;

  filePath = _.path.pathRebase( filePath,self.oldPath,self.newPath );
  filePath = self.original.pathNativize( filePath );

  return filePath;
}

// --
// relationship
// --

var Composes =
{
  oldPath : '/',
  newPath : '/',
}

var Aggregates =
{
}

var Associates =
{
  original : null,
}

var Restricts =
{
}

// --
// define class
// --

// var Extend =
// {
//   // _initReroot : _initReroot,
// }

//

var Proto =
{

  init : init,
  // _initReroot : _initReroot,

  pathNativize : pathNativize,

  //

  
  Composes : Composes,
  Aggregates : Aggregates,
  Associates : Associates,
  Restricts : Restricts,

}

//

// _.mapExtend( Proto,Extend );

_.classMake
({
  cls : Self,
  parent : Parent,
  extend : Proto,
});

_.Copyable.mixin( Self );

//

_.FileFilter = _.FileFilter || Object.create( null );
_.FileFilter[ Self.shortName ] = Self;

// --
// export
// --

if( typeof module !== 'undefined' )
if( _global_.WTOOLS_PRIVATE )
delete require.cache[ module.id ];

if( typeof module !== 'undefined' && module !== null )
module[ 'exports' ] = Self;

})();
