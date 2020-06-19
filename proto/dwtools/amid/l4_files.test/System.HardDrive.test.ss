( function _System_HardDrive_test_ss_( ) {

'use strict';

if( typeof module !== 'undefined' )
{

  require( './aFileProvider.test.s' );

}

//

var _ = _global_.wTools;
var Parent = wTests[ 'Tools.mid.files.fileProvider.Abstract' ];

_.assert( !!Parent );

//

function pathFor( filePath )
{
  var self = this;

  filePath =  _.path.join( self.suiteTempPath,  filePath );

  return self.providerEffective.originPath + _.path.normalize( filePath );
}

//

function onSuiteBegin()
{
  var self = this;

  self.suiteTempPath = _.path.pathDirTempOpen( _.path.join( __dirname, '../..'  ), 'System/HardDrive' );

  self.provider.providerRegister( self.providerEffective );
  self.provider.defaultProvider = self.providerEffective;
  self.globalFromPreferred = _.routineJoin( self.providerEffective.path, self.providerEffective.path.globalFromPreferred );
  self.provider.UsingBigIntForStat = self.providerEffective.UsingBigIntForStat;
  // self.provider.defaultOrigin = self.providerEffective.originPath;
  // self.provider.defaultProtocol = self.providerEffective.protocol;

}

function onSuiteEnd()
{
  _.assert( _.strHas( this.suiteTempPath, '.tmp' ), this.suiteTempPath );
  // this.providerEffective.filesDelete({ filePath : this.suiteTempPath });
  _.path.pathDirTempClose( this.suiteTempPath );
}

function onRoutineEnd( test )
{
  let context = this;
  let system = context.system || context.provider;
  _.sure( system instanceof _.FileProvider.System );
  _.sure( _.entityIdentical( _.mapKeys( system.providersWithProtocolMap ), [ 'file', 'hd' ] ), test.name, 'has not restored system!' );
}

// --
// declare
// --

var Proto =
{

  name : 'Tools.mid.files.fileProvider.System.HardDrive',
  abstract : 0,
  silencing : 1,
  enabled : 1,

  onSuiteBegin,
  onSuiteEnd,
  onRoutineEnd,

  context :
  {
    provider : _.FileProvider.System({ empty : 1 }),
    providerEffective : _.FileProvider.HardDrive(),
    suiteTempPath : null,

    pathFor,
    globalFromPreferred : null
    // testFile : null,
    // suiteTempPath : __dirname + '/../../../../tmp.tmp/hard-drive',
    // testFile : __dirname + '/../../../../tmp.tmp/hard-drive/test.txt',
  },

  tests :
  {
  },

}

//

var Self = new wTestSuite( Proto ).inherit( Parent );
if( typeof module !== 'undefined' && !module.parent )
wTester.test( Self.name );

} )( );